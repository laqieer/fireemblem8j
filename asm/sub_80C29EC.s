	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C29EC, "ax", %progbits
@ sub_80C29EC @ JP 0x080C29EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C29EC
	.thumb_func
sub_80C29EC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x2c
	movs r5, #6
_080C29F6:
	ldr r1, [r4, #0x14]
	ldr r0, _080C2A0C @ =0x08AC1C08
	bl sub_8002BCC
	stm r6!, {r0}
	subs r5, #1
	cmp r5, #0
	bge _080C29F6
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C2A0C: .4byte 0x08AC1C08

