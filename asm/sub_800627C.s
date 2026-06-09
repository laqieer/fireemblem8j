	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006038, 0x08006038 + 1
	.set sub_80061BC, 0x080061BC + 1
	.section .text.sub_800627C, "ax", %progbits
@ sub_800627C @ JP 0x0800627C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800627C
	.thumb_func
sub_800627C:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bgt _08006290
	adds r0, r4, #0
	bl sub_80061BC
	b _080062B8
_08006290:
	adds r0, r4, #0
	movs r1, #1
	bl sub_8006038
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _080062A8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080062A8:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _080062B8
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080062B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

