	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set sub_80C1DE8, 0x080C1DE8 + 1
	.section .text.sub_80C572C, "ax", %progbits
@ sub_80C572C @ JP 0x080C572C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C572C
	.thumb_func
sub_80C572C:
	push {r4, lr}
	bl sub_80C1DE8
	adds r4, r0, #0
	ldr r0, _080C5764 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080C574A
	ldr r0, _080C5768 @ =0x03005270
	bl GetNextUnclearedNode
	cmp r0, r4
	beq _080C577A
_080C574A:
	movs r1, #0
	ldr r0, _080C576C @ =0x081F661D
	ldrb r0, [r0]
	cmp r1, r0
	bge _080C577A
	ldr r3, _080C5770 @ =0x081F6614
	adds r2, r0, #0
_080C5758:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r4, r0
	bne _080C5774
	movs r0, #1
	b _080C577C
	.align 2, 0
_080C5764: .4byte 0x0202BCEC
_080C5768: .4byte 0x03005270
_080C576C: .4byte 0x081F661D
_080C5770: .4byte 0x081F6614
_080C5774:
	adds r1, #1
	cmp r1, r2
	blt _080C5758
_080C577A:
	movs r0, #0
_080C577C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

