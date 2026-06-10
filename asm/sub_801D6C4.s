	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitBmBgLayers, 0x08015624 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_801D6C4, "ax", %progbits
@ sub_801D6C4 @ JP 0x0801D6C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801D6C4
	.thumb_func
sub_801D6C4:
	push {lr}
	adds r0, #0x4a
	ldrh r1, [r0]
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0801D6E0
	ldr r0, _0801D6F4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
_0801D6E0:
	ldr r2, _0801D6F8 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0xfc
	ands r0, r1
	strb r0, [r2, #4]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_0801D6F4: .4byte 0x02023CA8
_0801D6F8: .4byte 0x0202BCAC

