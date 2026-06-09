	.syntax unified
	.set UnitHasMagicRank, 0x0801876C + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_808AE20, "ax", %progbits
@ sub_808AE20 @ JP 0x0808AE20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AE20
	.thumb_func
sub_808AE20:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _0808AE58 @ =0x081F550A
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _0808AE5C @ =0x02003BFC
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808AE44
	adds r4, #4
_0808AE44:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808AE58: .4byte 0x081F550A
_0808AE5C: .4byte 0x02003BFC

