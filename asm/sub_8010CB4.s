	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8002EB4, 0x08002EB4 + 1
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8012340, 0x08012340 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_8010CB4, "ax", %progbits
@ sub_8010CB4 @ JP 0x08010CB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010CB4
	.thumb_func
sub_8010CB4:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	movs r2, #2
	ldrsh r1, [r0, r2]
	mov sb, r1
	movs r1, #4
	ldrsh r6, [r0, r1]
	movs r1, #6
	ldrsh r2, [r0, r1]
	mov r8, r2
	ldr r0, _08010D20 @ =0x085B9D0C
	adds r1, r5, #0
	bl Proc_StartBlocking
	adds r4, r0, #0
	str r5, [r4, #0x58]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #7
	bl sub_8002EB4
	mov r0, sb
	bl sub_800BF3C
	adds r4, r0, #0
	movs r1, #0
	bl SetUnitStatus
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	mov r2, r8
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8012340
	movs r0, #2
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08010D20: .4byte 0x085B9D0C

