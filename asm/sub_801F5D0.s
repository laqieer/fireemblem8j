	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_801F5D0, "ax", %progbits
@ sub_801F5D0 @ JP 0x0801F5D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F5D0
	.thumb_func
sub_801F5D0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _0801F5F4 @ =0x085C3520
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	cmp r7, #1
	beq _0801F5FE
	cmp r7, #1
	bgt _0801F5F8
	cmp r7, #0
	beq _0801F606
	b _0801F616
	.align 2, 0
_0801F5F4: .4byte 0x085C3520
_0801F5F8:
	cmp r7, #3
	beq _0801F60E
	b _0801F616
_0801F5FE:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #0
	b _0801F614
_0801F606:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #1
	b _0801F614
_0801F60E:
	adds r1, r0, #0
	adds r1, #0x4a
	movs r0, #2
_0801F614:
	strh r0, [r1]
_0801F616:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

