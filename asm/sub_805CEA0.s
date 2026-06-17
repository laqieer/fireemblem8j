	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_805CF64, 0x0805CF64 + 1
	.section .text.NewEfxTeonoOBJ2, "ax", %progbits
@ NewEfxTeonoOBJ2 @ JP 0x0805CEA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewEfxTeonoOBJ2
	.thumb_func
NewEfxTeonoOBJ2:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805CEE0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805CEE4 @ =0x085FF2F0
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	ldr r3, _0805CEE8 @ =0x08604EA0
	ldr r2, _0805CEEC @ =0x08604B08
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r5, r0, #0
	str r5, [r6, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805CEF0
	ldrh r0, [r5, #2]
	adds r0, #0x48
	b _0805CEF4
	.align 2, 0
_0805CEE0: .4byte 0x0201774C
_0805CEE4: .4byte 0x085FF2F0
_0805CEE8: .4byte 0x08604EA0
_0805CEEC: .4byte 0x08604B08
_0805CEF0:
	ldrh r0, [r5, #2]
	subs r0, #0x48
_0805CEF4:
	strh r0, [r5, #2]
	ldr r0, _0805CF1C @ =0x08604784
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805CF20 @ =0x08604384
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	ldr r0, [r6, #0x5c]
	ldr r1, [r6, #0x60]
	bl sub_805CF64
	str r0, [r6, #0x64]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CF1C: .4byte 0x08604784
_0805CF20: .4byte 0x08604384

