	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80C6134, 0x080C6134 + 1
	.section .text.sub_80C7D78, "ax", %progbits
@ sub_80C7D78 @ JP 0x080C7D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7D78
	.thumb_func
sub_80C7D78:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	beq _080C7D98
	ldr r0, _080C7D94 @ =0x08AC26D8
	bl Proc_StartBlocking
	b _080C7DA0
	.align 2, 0
_080C7D94: .4byte 0x08AC26D8
_080C7D98:
	ldr r0, _080C7DE8 @ =0x08AC26D8
	movs r1, #3
	bl sub_8002BCC
_080C7DA0:
	adds r4, r0, #0
	adds r0, r4, #0
	adds r0, #0x2b
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	strh r7, [r4, #0x2e]
	mov r0, r8
	strh r0, [r4, #0x30]
	adds r0, r4, #0
	adds r0, #0x2a
	mov r1, sp
	ldrb r1, [r1, #0x18]
	strb r1, [r0]
	movs r0, #2
	ldr r2, [sp, #0x18]
	ands r0, r2
	cmp r0, #0
	beq _080C7DEC
	movs r0, #0
	movs r1, #1
	bl sub_80C6134
	str r0, [r4, #0x34]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	strh r7, [r0, #0x2c]
	ldr r0, [r4, #0x34]
	mov r1, r8
	strh r1, [r0, #0x2e]
	b _080C7DEE
	.align 2, 0
_080C7DE8: .4byte 0x08AC26D8
_080C7DEC:
	str r0, [r4, #0x34]
_080C7DEE:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

