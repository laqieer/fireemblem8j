	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C8DC4, "ax", %progbits
@ sub_80C8DC4 @ JP 0x080C8DC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8DC4
	.thumb_func
sub_80C8DC4:
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _080C8DD8
	ldr r0, _080C8DD4 @ =0x08AC28B0
	bl Proc_StartBlocking
	b _080C8DE0
	.align 2, 0
_080C8DD4: .4byte 0x08AC28B0
_080C8DD8:
	ldr r0, _080C8DEC @ =0x08AC28B0
	movs r1, #3
	bl sub_8002BCC
_080C8DE0:
	adds r1, r0, #0
	adds r1, #0x29
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C8DEC: .4byte 0x08AC28B0

