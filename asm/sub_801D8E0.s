	.syntax unified
	.set Make6CMOVEUNITForUnitBeingRescued, 0x0801D864 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.section .text.sub_801D8E0, "ax", %progbits
@ sub_801D8E0 @ JP 0x0801D8E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D8E0
	.thumb_func
sub_801D8E0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r4, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, _0801D930 @ =0x085C3208
	bl Proc_StartBlocking
	adds r7, r0, #0
	str r6, [r7, #0x30]
	str r4, [r7, #0x2c]
	adds r5, r7, #0
	adds r5, #0x38
	movs r0, #0xe
	strb r0, [r5]
	adds r0, r7, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x3a
	movs r0, #4
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x3c
	mov r1, r8
	strb r1, [r0]
	adds r0, r6, #0
	bl Make6CMOVEUNITForUnitBeingRescued
	str r0, [r7, #0x34]
	adds r1, r5, #0
	bl SetMuMoveScript
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D930: .4byte 0x085C3208

