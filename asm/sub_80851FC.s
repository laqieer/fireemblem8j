	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80851FC, "ax", %progbits
@ sub_80851FC @ JP 0x080851FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80851FC
	.thumb_func
sub_80851FC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldr r7, _08085244 @ =0x08A5A618
	adds r0, r7, #4
	mov r8, r0
_08085210:
	ldr r0, [r4]
	ldrh r5, [r0]
	adds r6, r5, #0
	ldrh r0, [r0, #2]
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08085232
	lsls r0, r5, #3
	adds r0, r0, r7
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_80D65C0
	cmp r0, #1
	beq _08085248
_08085232:
	lsls r0, r6, #3
	add r0, r8
	ldr r1, [r0]
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	b _08085210
	.align 2, 0
_08085244: .4byte 0x08A5A618
_08085248:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _08085252
	movs r0, #0
	b _08085254
_08085252:
	adds r0, r4, #0
_08085254:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

