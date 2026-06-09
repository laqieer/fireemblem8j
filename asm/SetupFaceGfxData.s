	.syntax unified
	.section .text.SetupFaceGfxData, "ax", %progbits
@ SetupFaceGfxData @ JP 0x0800544C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetupFaceGfxData
	.thumb_func
SetupFaceGfxData:
	push {lr}
	cmp r0, #0
	bne _08005454
	ldr r0, _08005470 @ =0x085B8D84
_08005454:
	ldr r2, _08005474 @ =0x0202A688
	adds r1, r0, #0
	movs r3, #3
_0800545A:
	ldr r0, [r1]
	str r0, [r2]
	ldrh r0, [r1, #4]
	strh r0, [r2, #4]
	adds r2, #8
	adds r1, #8
	subs r3, #1
	cmp r3, #0
	bge _0800545A
	pop {r0}
	bx r0
	.align 2, 0
_08005470: .4byte 0x085B8D84
_08005474: .4byte 0x0202A688

