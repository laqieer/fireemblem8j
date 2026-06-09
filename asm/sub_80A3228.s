	.syntax unified
	.section .text.sub_80A3228, "ax", %progbits
@ sub_80A3228 @ JP 0x080A3228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3228
	.thumb_func
sub_80A3228:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080A3248 @ =0x0202BCEC
	adds r0, #0x2b
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r1, [r0]
	ldr r0, _080A324C @ =0x000007B7
	subs r0, r0, r1
	str r0, [r2, #0x30]
	pop {r0}
	bx r0
	.align 2, 0
_080A3248: .4byte 0x0202BCEC
_080A324C: .4byte 0x000007B7

