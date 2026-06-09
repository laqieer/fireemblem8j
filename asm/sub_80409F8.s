	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set sub_803B810, 0x0803B810 + 1
	.section .text.sub_80409F8, "ax", %progbits
@ sub_80409F8 @ JP 0x080409F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80409F8
	.thumb_func
sub_80409F8:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _08040A58 @ =0x0203AA00
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08040A4E
	ldr r0, _08040A5C @ =0x03004DF0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #1
	bne _08040A4E
	add r4, sp, #0xc
	adds r0, r2, #0
	adds r1, r4, #0
	bl sub_803B810
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08040A4E
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_08040A4E:
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08040A58: .4byte 0x0203AA00
_08040A5C: .4byte 0x03004DF0

