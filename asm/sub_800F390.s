	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetCameraCenteredX, 0x08015A5C + 1
	.set GetCameraCenteredY, 0x08015A88 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800F364, 0x0800F364 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8030E94, 0x08030E94 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_800F390, "ax", %progbits
@ sub_800F390 @ JP 0x0800F390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event25_ChangeMap
	.thumb_func
Event25_ChangeMap:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	movs r1, #2
	ldrsh r4, [r0, r1]
	ldr r0, _0800F408 @ =0x030004DC
	ldrb r6, [r0]
	ldrb r7, [r0, #2]
	cmp r4, #0
	bge _0800F3AA
	subs r0, #0x2c
	movs r1, #8
	ldrsh r4, [r0, r1]
_0800F3AA:
	adds r0, r5, #0
	bl sub_800F364
	ldr r0, _0800F40C @ =0x0202BCEC
	strb r4, [r0, #0xe]
	bl sub_8030E94
	lsls r0, r6, #4
	bl GetCameraCenteredX
	ldr r4, _0800F410 @ =0x0202BCAC
	strh r0, [r4, #0xc]
	lsls r0, r7, #4
	bl GetCameraCenteredY
	strh r0, [r4, #0xe]
	bl RefreshEntityBmMaps
	bl sub_8019914
	bl sub_8027144
	bl sub_80310F4
	adds r0, r5, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
	ldr r0, _0800F414 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0800F418 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800F408: .4byte 0x030004DC
_0800F40C: .4byte 0x0202BCEC
_0800F410: .4byte 0x0202BCAC
_0800F414: .4byte 0x02022CA8
_0800F418: .4byte 0x020234A8

