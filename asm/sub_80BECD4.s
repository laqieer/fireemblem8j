	.syntax unified
	.set GmapSoguExists, 0x080C6498 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80BECD4, "ax", %progbits
@ sub_80BECD4 @ JP 0x080BECD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BECD4
	.thumb_func
sub_80BECD4:
	push {r4, lr}
	adds r4, r0, #0
	bl GmapSoguExists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BECEE
	ldr r1, _080BECF4 @ =0x03005270
	movs r0, #1
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl sub_8002DE4
_080BECEE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BECF4: .4byte 0x03005270

