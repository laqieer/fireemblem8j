	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C8E00, 0x080C8E00 + 1
	.section .text.sub_80A0E18, "ax", %progbits
@ sub_80A0E18 @ JP 0x080A0E18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0E18
	.thumb_func
sub_80A0E18:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A0E44 @ =0x08A93FE8
	bl Proc_Find
	adds r2, r0, #0
	movs r0, #0
	strh r0, [r4, #0x36]
	movs r0, #0xff
	strh r0, [r4, #0x34]
	ldr r0, _080A0E48 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A0E54
	bl sub_80C8E00
	cmp r0, #0
	beq _080A0E4C
	adds r0, #0x2a
	b _080A0E58
	.align 2, 0
_080A0E44: .4byte 0x08A93FE8
_080A0E48: .4byte 0x03005270
_080A0E4C:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
	b _080A0E5E
_080A0E54:
	adds r0, r2, #0
	adds r0, #0x31
_080A0E58:
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
_080A0E5E:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x31
	movs r0, #0
	movs r1, #4
	strb r1, [r2]
	adds r1, r4, #0
	adds r1, #0x30
	strb r0, [r1]
	movs r3, #0
	adds r1, #0x1a
	adds r0, r4, #0
	adds r0, #0x38
	movs r2, #8
_080A0E7A:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080A0E7A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

