	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801157C, "ax", %progbits
@ sub_801157C @ JP 0x0801157C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801157C
	.thumb_func
sub_801157C:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _08011598
	ldr r0, _08011594 @ =0x085B9FAC
	bl Proc_StartBlocking
	b _080115A0
	.align 2, 0
_08011594: .4byte 0x085B9FAC
_08011598:
	ldr r0, _080115C4 @ =0x085B9FAC
	movs r1, #3
	bl sub_8002BCC
_080115A0:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080115C4: .4byte 0x085B9FAC

