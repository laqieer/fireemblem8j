	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80817CC, "ax", %progbits
@ sub_80817CC @ JP 0x080817CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80817CC
	.thumb_func
sub_80817CC:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _08081860 @ =0x08A1CE1C
	ldr r1, _08081864 @ =0x06013800
	bl sub_8013008
	ldr r0, _08081868 @ =0x08A1D030
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	ldr r2, _0808186C @ =0x0203E1EC
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r2, _08081870 @ =0x0202BCAC
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r5, r1, #1
	lsls r1, r1, #4
	adds r4, r1, #0
	adds r4, #0x10
	movs r1, #0x11
	ldrsb r1, [r3, r1]
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	subs r1, r1, r0
	lsls r0, r1, #1
	lsls r1, r1, #4
	adds r2, r1, #0
	subs r2, #8
	cmp r0, #3
	bgt _08081826
	adds r2, #0x20
_08081826:
	cmp r5, #3
	bgt _0808182C
	movs r4, #0x30
_0808182C:
	cmp r5, #0x19
	ble _08081832
	movs r4, #0xd0
_08081832:
	ldr r0, _08081874 @ =0x08A160F4
	movs r3, #0xc7
	lsls r3, r3, #6
	movs r1, #0
	str r1, [sp]
	movs r1, #2
	str r1, [sp, #4]
	adds r1, r4, #0
	bl sub_8009608
	ldr r0, _08081878 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08081858
	movs r0, #0x5b
	bl m4aSongNumStart
_08081858:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081860: .4byte 0x08A1CE1C
_08081864: .4byte 0x06013800
_08081868: .4byte 0x08A1D030
_0808186C: .4byte 0x0203E1EC
_08081870: .4byte 0x0202BCAC
_08081874: .4byte 0x08A160F4
_08081878: .4byte 0x0202BCEC

