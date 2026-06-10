	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80082DC, "ax", %progbits
@ sub_80082DC @ JP 0x080082DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80082DC
	.thumb_func
sub_80082DC:
	push {lr}
	ldr r0, _080082F0 @ =0x085B92C8
	movs r1, #3
	bl sub_8002BCC
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080082F0: .4byte 0x085B92C8

