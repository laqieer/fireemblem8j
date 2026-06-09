	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_809A868, 0x0809A868 + 1
	.set sub_809A890, 0x0809A890 + 1
	.set sub_809ACDC, 0x0809ACDC + 1
	.set sub_809AD4C, 0x0809AD4C + 1
	.set sub_809AEC0, 0x0809AEC0 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809AF64, 0x0809AF64 + 1
	.set sub_809C178, 0x0809C178 + 1
	.set sub_809C250, 0x0809C250 + 1
	.set sub_809C360, 0x0809C360 + 1
	.set sub_809C7D4, 0x0809C7D4 + 1
	.set sub_80B1544, 0x080B1544 + 1
	.set sub_80B1584, 0x080B1584 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809AF98, "ax", %progbits
@ sub_809AF98 @ JP 0x0809AF98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AF98
	.thumb_func
sub_809AF98:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	bl sub_804F8F4
	movs r0, #1
	movs r1, #0
	movs r2, #4
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_809C360
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xc0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_809AF64
	ldr r0, _0809B050 @ =0x08A98350
	ldr r4, _0809B054 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0809B058 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _0809B05C @ =0x085E0DF4
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809B060 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x3c
	movs r3, #0x4c
	bl sub_809C178
	ldr r4, _0809B064 @ =0x02013510
	ldr r7, _0809B068 @ =0x02022EEC
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	movs r3, #2
	bl sub_809C250
	ldr r0, _0809B06C @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B070
	adds r0, r7, #0
	subs r0, #0x20
	bl sub_809AD4C
	b _0809B078
	.align 2, 0
_0809B050: .4byte 0x08A98350
_0809B054: .4byte 0x02020188
_0809B058: .4byte 0x020234A8
_0809B05C: .4byte 0x085E0DF4
_0809B060: .4byte 0x00000503
_0809B064: .4byte 0x02013510
_0809B068: .4byte 0x02022EEC
_0809B06C: .4byte 0x03005270
_0809B070:
	adds r0, r7, #0
	adds r0, #0x60
	bl sub_809ACDC
_0809B078:
	adds r1, r6, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x14
	ldrh r0, [r6, #0x34]
	subs r0, #4
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #7
	bl sub_80B1FBC
	adds r0, r6, #0
	movs r1, #0
	bl sub_809C7D4
	bl sub_80B1584
	bl sub_80B1544
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #9
	adds r3, r6, #0
	bl sub_808B750
	bl sub_809AEC0
	ldr r0, _0809B0EC @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809B0F4
	ldr r0, _0809B0F0 @ =sub_809AE40
	adds r1, r6, #0
	bl sub_80B1D98
	b _0809B0FC
	.align 2, 0
_0809B0EC: .4byte 0x03005270
_0809B0F0: .4byte 0x0809AE41  @ sub_809AE40
_0809B0F4:
	ldr r0, _0809B114 @ =sub_809AE20
	adds r1, r6, #0
	bl sub_80B1D98
_0809B0FC:
	bl sub_809A890
	bl sub_809A868
	movs r0, #7
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809B114: .4byte 0x0809AE21  @ sub_809AE20

