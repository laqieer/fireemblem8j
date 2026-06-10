	.syntax unified
	.set APProc_SetParameters, 0x08009688 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80090F0, "ax", %progbits
@ sub_80090F0 @ JP 0x080090F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80090F0
	.thumb_func
sub_80090F0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, [r4, #0x34]
	ldr r5, [r6]
	cmp r5, #0
	beq _08009130
	ldr r2, _08009128 @ =0x0202BCAC
	movs r1, #0xc
	ldrsh r0, [r2, r1]
	ldr r1, [r4, #0x2c]
	subs r1, r1, r0
	adds r1, #8
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	ldr r2, [r4, #0x30]
	subs r2, r2, r0
	adds r2, #8
	ldr r0, _0800912C @ =0x000001FF
	ands r1, r0
	movs r0, #0xff
	ands r2, r0
	movs r3, #1
	rsbs r3, r3, #0
	adds r0, r6, #0
	bl APProc_SetParameters
	b _08009138
	.align 2, 0
_08009128: .4byte 0x0202BCAC
_0800912C: .4byte 0x000001FF
_08009130:
	adds r0, r4, #0
	bl sub_8002DE4
	str r5, [r4, #0x34]
_08009138:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

