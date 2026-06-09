	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80658DC, "ax", %progbits
@ sub_80658DC @ JP 0x080658DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80658DC
	.thumb_func
sub_80658DC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080658F8 @ =0x08601518
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080658F8: .4byte 0x08601518

