	.syntax unified
	.set StartStarImplosionEffect, 0x08081B98 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80840C4, "ax", %progbits
@ sub_80840C4 @ JP 0x080840C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80840C4
	.thumb_func
sub_80840C4:
	push {r4, lr}
	ldr r0, _08084114 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080840D8
	movs r0, #0xb5
	bl m4aSongNumStart
_080840D8:
	ldr r2, _08084118 @ =0x0203E1EC
	adds r0, r2, #0
	adds r0, #0x59
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0x10
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	ldr r2, _0808411C @ =0x0202BCAC
	movs r4, #0xc
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	adds r0, #8
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	lsls r1, r1, #4
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	adds r1, #8
	bl StartStarImplosionEffect
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084114: .4byte 0x0202BCEC
_08084118: .4byte 0x0203E1EC
_0808411C: .4byte 0x0202BCAC

