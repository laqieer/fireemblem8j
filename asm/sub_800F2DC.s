	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ClearTalkFaceRefs, 0x080066EC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set ResetFaces, 0x08005430 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80080A4, 0x080080A4 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800F364, 0x0800F364 + 1
	.set sub_80310F4, 0x080310F4 + 1
	.section .text.sub_800F2DC, "ax", %progbits
@ sub_800F2DC @ JP 0x0800F2DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F2DC
	.thumb_func
sub_800F2DC:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80310F4
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
	ldr r0, _0800F32C @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0800F330 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_80080A4
	ldr r0, _0800F334 @ =0x085B8EEC
	bl Proc_EndEach
	bl ResetFaces
	bl ClearTalkFaceRefs
	adds r0, r4, #0
	bl sub_800F364
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F32C: .4byte 0x02022CA8
_0800F330: .4byte 0x020234A8
_0800F334: .4byte 0x085B8EEC

