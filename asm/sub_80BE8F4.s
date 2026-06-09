	.syntax unified
	.set GetGmSkirmishUnitAtNode, 0x080C185C + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set sub_80C2EF0, 0x080C2EF0 + 1
	.set sub_80C55A4, 0x080C55A4 + 1
	.section .text.sub_80BE8F4, "ax", %progbits
@ sub_80BE8F4 @ JP 0x080BE8F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE8F4
	.thumb_func
sub_80BE8F4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	movs r1, #0
	movs r2, #0
	bl sub_80C2EF0
	ldr r4, _080BE928 @ =0x03005270
	ldrb r0, [r4, #0x11]
	bl WMLoc_GetChapterId
	ldr r1, _080BE92C @ =0x0202BCEC
	movs r2, #0
	strb r0, [r1, #0xe]
	strb r2, [r4, #1]
	ldrb r0, [r4, #0x11]
	bl GetGmSkirmishUnitAtNode
	adds r1, r0, #0
	movs r0, #0
	adds r2, r5, #0
	bl sub_80C55A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BE928: .4byte 0x03005270
_080BE92C: .4byte 0x0202BCEC

