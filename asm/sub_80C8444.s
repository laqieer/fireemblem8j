	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C8444, "ax", %progbits
@ sub_80C8444 @ JP 0x080C8444 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8444
	.thumb_func
sub_80C8444:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080C8454 @ =0x08AC2808
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080C8454: .4byte 0x08AC2808

