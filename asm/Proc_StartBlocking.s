	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.Proc_StartBlocking, "ax", %progbits
@ Proc_StartBlocking @ JP 0x08002C30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Proc_StartBlocking
	.thumb_func
Proc_StartBlocking:
	push {lr}
	bl sub_8002BCC
	adds r2, r0, #0
	ldr r0, [r2]
	cmp r0, #0
	beq _08002C58
	adds r3, r2, #0
	adds r3, #0x27
	ldrb r1, [r3]
	movs r0, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, [r2, #0x14]
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	b _08002C5A
_08002C58:
	movs r0, #0
_08002C5A:
	pop {r1}
	bx r1
	.align 2, 0

