	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C6CD0, "ax", %progbits
@ sub_80C6CD0 @ JP 0x080C6CD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6CD0
	.thumb_func
sub_80C6CD0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080C6CEC
	ldr r0, _080C6CE8 @ =0x08AC24D0
	bl Proc_StartBlocking
	b _080C6CF4
	.align 2, 0
_080C6CE8: .4byte 0x08AC24D0
_080C6CEC:
	ldr r0, _080C6D10 @ =0x08AC24D0
	movs r1, #3
	bl sub_8002BCC
_080C6CF4:
	adds r1, r0, #0
	strh r4, [r1, #0x2a]
	strh r5, [r1, #0x2c]
	strh r6, [r1, #0x2e]
	strh r7, [r1, #0x30]
	ldr r0, [sp, #0x14]
	strh r0, [r1, #0x36]
	ldr r0, [sp, #0x18]
	strh r0, [r1, #0x32]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C6D10: .4byte 0x08AC24D0

