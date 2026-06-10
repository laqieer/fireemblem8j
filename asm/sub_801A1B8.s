	.syntax unified
	.set CallARM_FillMovementMap, 0x08002B44 + 1
	.set sub_80194BC, 0x080194BC + 1
	.section .text.sub_801A1B8, "ax", %progbits
@ sub_801A1B8 @ JP 0x0801A1B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801A1B8
	.thumb_func
sub_801A1B8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r7, r1, #0
	ldr r1, _0801A1D8 @ =0x03004E00
	ldr r0, _0801A1DC @ =0x03004950
	str r0, [r1, #4]
	ldr r0, _0801A1E0 @ =0x03004BF0
	str r0, [r1]
	strb r2, [r1, #9]
	adds r6, r1, #0
	cmp r3, #0
	bne _0801A1E4
	strb r3, [r6, #8]
	b _0801A1EA
	.align 2, 0
_0801A1D8: .4byte 0x03004E00
_0801A1DC: .4byte 0x03004950
_0801A1E0: .4byte 0x03004BF0
_0801A1E4:
	movs r0, #1
	strb r0, [r6, #8]
	strb r3, [r6, #0xa]
_0801A1EA:
	movs r0, #0
	mov r8, r0
	movs r0, #0x78
	strb r0, [r6, #0xb]
	ldr r4, _0801A238 @ =0x03004940
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, [r6, #4]
	strb r5, [r0]
	ldr r0, [r6, #4]
	strb r7, [r0, #1]
	ldr r1, [r6, #4]
	movs r0, #5
	strb r0, [r1, #2]
	ldr r0, [r6, #4]
	mov r1, r8
	strb r1, [r0, #3]
	ldr r1, [r4]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r5
	mov r1, r8
	strb r1, [r0]
	ldr r0, [r6, #4]
	adds r0, #4
	str r0, [r6, #4]
	movs r1, #4
	strb r1, [r0, #2]
	bl CallARM_FillMovementMap
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A238: .4byte 0x03004940

