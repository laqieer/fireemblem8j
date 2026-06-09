	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C52D8, "ax", %progbits
@ sub_80C52D8 @ JP 0x080C52D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C52D8
	.thumb_func
sub_80C52D8:
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _080C52EC
	ldr r0, _080C52E8 @ =0x08AC206C
	bl Proc_StartBlocking
	b _080C52F4
	.align 2, 0
_080C52E8: .4byte 0x08AC206C
_080C52EC:
	ldr r0, _080C5300 @ =0x08AC206C
	movs r1, #3
	bl sub_8002BCC
_080C52F4:
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C5300: .4byte 0x08AC206C

