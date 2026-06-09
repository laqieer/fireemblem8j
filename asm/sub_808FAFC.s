	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_808FAFC, "ax", %progbits
@ sub_808FAFC @ JP 0x0808FAFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FAFC
	.thumb_func
sub_808FAFC:
	push {lr}
	ldr r0, _0808FB44 @ =0x08A739C4
	bl Proc_Find
	cmp r0, #0
	beq _0808FB14
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808FB40
_0808FB14:
	ldr r0, _0808FB48 @ =0x08A73964
	bl Proc_Find
	cmp r0, #0
	beq _0808FB2A
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808FB40
_0808FB2A:
	ldr r0, _0808FB4C @ =0x08A73A9C
	bl Proc_Find
	cmp r0, #0
	beq _0808FB50
	adds r0, #0x56
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0808FB50
_0808FB40:
	movs r0, #1
	b _0808FB52
	.align 2, 0
_0808FB44: .4byte 0x08A739C4
_0808FB48: .4byte 0x08A73964
_0808FB4C: .4byte 0x08A73A9C
_0808FB50:
	movs r0, #0
_0808FB52:
	pop {r1}
	bx r1
	.align 2, 0

