	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8006038, 0x08006038 + 1
	.set sub_80061BC, 0x080061BC + 1
	.section .text.sub_8006230, "ax", %progbits
@ sub_8006230 @ JP 0x08006230 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006230
	.thumb_func
sub_8006230:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #5
	bgt _08006244
	adds r0, r4, #0
	bl sub_80061BC
	b _0800626C
_08006244:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8006038
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0800625C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0800625C:
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bne _0800626C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_0800626C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

