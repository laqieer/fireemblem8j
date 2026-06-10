	.syntax unified
	.section .text.sub_80446E4, "ax", %progbits
@ sub_80446E4 @ JP 0x080446E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80446E4
	.thumb_func
sub_80446E4:
	push {lr}
	adds r1, r0, #0
	movs r2, #0
	b _080446F0
_080446EC:
	adds r2, #1
	adds r1, #2
_080446F0:
	ldrb r0, [r1]
	cmp r0, #0
	bne _080446EC
	adds r0, r2, #0
	pop {r1}
	bx r1

