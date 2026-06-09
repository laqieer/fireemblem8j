	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_805FBAC, "ax", %progbits
@ sub_805FBAC @ JP 0x0805FBAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805FBAC
	.thumb_func
sub_805FBAC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _0805FBE0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805FBE4 @ =0x020228A8
	ldr r1, _0805FBE8 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	ldr r0, _0805FBEC @ =0x085FFAF8
	movs r1, #0
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FBE0: .4byte 0x0201774C
_0805FBE4: .4byte 0x020228A8
_0805FBE8: .4byte 0x020165C8
_0805FBEC: .4byte 0x085FFAF8

