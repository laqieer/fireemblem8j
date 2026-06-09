	.syntax unified
	.set sub_8098234, 0x08098234 + 1
	.set sub_8099640, 0x08099640 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80982E4, "ax", %progbits
@ sub_80982E4 @ JP 0x080982E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80982E4
	.thumb_func
sub_80982E4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8099640
	adds r0, r4, #0
	bl sub_8098234
	adds r4, #0x2e
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x1c
	movs r2, #7
	bl sub_80B1FBC
	pop {r4}
	pop {r0}
	bx r0

