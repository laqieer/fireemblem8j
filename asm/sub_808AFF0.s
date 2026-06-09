	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetHelpBoxInitPosition, 0x0808B528 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B54C, 0x0808B54C + 1
	.section .text.sub_808AFF0, "ax", %progbits
@ sub_808AFF0 @ JP 0x0808AFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AFF0
	.thumb_func
sub_808AFF0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B03C @ =0x08A72BD8
	bl Proc_Find
	cmp r0, #0
	beq _0808B006
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #0
	strb r0, [r1]
_0808B006:
	adds r0, r4, #0
	adds r0, #0x52
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808B034
	ldr r0, _0808B040 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808B022
	movs r0, #0x71
	bl m4aSongNumStart
_0808B022:
	adds r0, r4, #0
	bl sub_808B54C
	ldr r0, [r4, #0x2c]
	ldrb r1, [r0, #0x10]
	ldrb r2, [r0, #0x11]
	adds r0, r4, #0
	bl SetHelpBoxInitPosition
_0808B034:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B03C: .4byte 0x08A72BD8
_0808B040: .4byte 0x0202BCEC

