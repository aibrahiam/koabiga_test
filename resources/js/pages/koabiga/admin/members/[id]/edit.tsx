import { Head, router } from '@inertiajs/react';
import { useState } from 'react';
import { ArrowLeft } from 'lucide-react';
import { Button } from '@/components/ui/button';
import MemberForm from '@/components/members/MemberForm';
import AppLayout from '@/layouts/app-layout';

interface Unit {
    id: number;
    name: string;
    code: string;
    zone_id: number;
    zone?: {
        id: number;
        name: string;
        code: string;
    };
}

interface Zone {
    id: number;
    name: string;
    code: string;
}

interface Member {
    id: number;
    christian_name: string;
    family_name: string;
    phone: string;
    secondary_phone?: string;
    national_id: string;
    gender: 'male' | 'female';
    role: 'member' | 'unit_leader' | 'zone_leader';
    status: 'active' | 'inactive';
    unit_id?: number;
    zone_id?: number;
}

interface EditMemberProps {
    member: Member;
    units: Unit[];
    zones: Zone[];
}

export default function EditMember({ member, units, zones }: EditMemberProps) {
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [errors, setErrors] = useState<Record<string, string>>({});

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true);
        setErrors({});

        try {
            await router.put(`/koabiga/admin/members/${member.id}`, data, {
                onSuccess: () => {
                    router.visit('/koabiga/admin/members');
                },
                onError: (errors) => {
                    setErrors(errors);
                    setIsSubmitting(false);
                }
            });
        } catch (error) {
            console.error('Error updating member:', error);
            setIsSubmitting(false);
        }
    };

    return (
        <AppLayout breadcrumbs={[
            { title: 'Admin', href: '/koabiga/admin' },
            { title: 'Members Management', href: '/koabiga/admin/members' },
            { title: `${member.christian_name} ${member.family_name}`, href: `/koabiga/admin/members/${member.id}` },
            { title: 'Edit Member', href: `/koabiga/admin/members/${member.id}/edit` }
        ]}>
            <Head title={`Edit Member - ${member.christian_name} ${member.family_name}`} />
            
            <div className="flex flex-col items-center justify-center min-h-screen py-8">
                <div className="w-full max-w-4xl space-y-6">

                    {/* Header */}
                    <div className="text-center space-y-4">
                        <div>
                            <h1 className="text-3xl font-bold text-green-800 dark:text-green-200">Edit Member</h1>
                            <p className="text-green-600 dark:text-green-300 mt-1">
                                Update information for {member.christian_name} {member.family_name}
                            </p>
                        </div>
                    </div>

                    {/* Back Button */}
                    <div className="flex justify-center">
                        <div className="w-full max-w-2xl">
                            <Button
                                variant="outline"
                                size="sm"
                                onClick={() => router.visit(`/koabiga/admin/members/${member.id}`)}
                                className="flex items-center"
                            >
                                <ArrowLeft className="w-4 h-4 mr-2" />
                                Back to Member Details
                            </Button>
                        </div>
                    </div>

                    {/* Form */}
                    <div className="flex justify-center">
                        <MemberForm
                            zones={zones}
                            units={units}
                            member={member}
                            onSubmit={handleSubmit}
                            isSubmitting={isSubmitting}
                            errors={errors}
                        />
                    </div>
                </div>
            </div>
        </AppLayout>
    );
} 