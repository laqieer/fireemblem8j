	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8015BF0, 0x08015BF0 + 1
	.section .text.sub_808A610, "ax", %progbits
@ sub_808A610 @ JP 0x0808A610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A610
	.thumb_func
sub_808A610:
	push {r4, r5, lr}
	sub sp, #0xc
	bl sub_8000CD8
	movs r2, #0
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x13
	bhi _0808A624
	movs r2, #1
_0808A624:
	adds r5, r2, #0
	ldr r1, _0808A6C8 @ =0x081F54EC
	add r0, sp, #4
	movs r2, #6
	bl memcpy
	ldr r4, _0808A6CC @ =0x02003BFC
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0808A6C0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0808A68A
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808A68A
	movs r0, #0x78
	movs r1, #0x28
	movs r2, #1
	bl sub_8015BF0
	movs r0, #0x78
	movs r1, #0x38
	movs r2, #1
	bl sub_8015BF0
	cmp r5, #0
	beq _0808A68A
	ldr r3, _0808A6D0 @ =0x085B8CDC
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808A6D4 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xb8
	movs r2, #0x4e
	bl PutSprite
_0808A68A:
	ldr r0, _0808A6CC @ =0x02003BFC
	ldr r2, [r0, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0808A6C0
	cmp r5, #0
	beq _0808A6C0
	ldr r3, _0808A6D0 @ =0x085B8CDC
	ldrb r0, [r2, #0x1b]
	lsrs r0, r0, #6
	lsls r0, r0, #1
	add r0, sp
	adds r0, #4
	ldrh r1, [r0]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldr r1, _0808A6D4 @ =0x00000803
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa
	movs r2, #0x56
	bl PutSprite
_0808A6C0:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A6C8: .4byte 0x081F54EC
_0808A6CC: .4byte 0x02003BFC
_0808A6D0: .4byte 0x085B8CDC
_0808A6D4: .4byte 0x00000803

