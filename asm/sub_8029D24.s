	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_8015EA8, 0x08015EA8 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8029D24, "ax", %progbits
@ sub_8029D24 @ JP 0x08029D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029D24
	.thumb_func
sub_8029D24:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r2, _08029D70 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, _08029D74 @ =0x000007FA
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8035610
	ldr r4, _08029D78 @ =0x03004DF0
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8015EA8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029D68
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_8015E18
_08029D68:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029D70: .4byte 0x0202BCAC
_08029D74: .4byte 0x000007FA
_08029D78: .4byte 0x03004DF0

