	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.section .text.sub_8036F2C, "ax", %progbits
@ sub_8036F2C @ JP 0x08036F2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036F2C
	.thumb_func
sub_8036F2C:
	push {r4, lr}
	adds r1, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r4, #0x14
	cmp r0, #1
	bne _08036F3C
	movs r4, #0x10
_08036F3C:
	adds r0, r1, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08036F74
	ldr r0, _08036F64 @ =0x02003D2C
	ldr r1, _08036F68 @ =0x02022CA8
	movs r2, #0xa
	adds r3, r4, #0
	bl j_TmCopyRect
	ldr r0, _08036F6C @ =0x0200422C
	ldr r1, _08036F70 @ =0x020234A8
	movs r2, #0xa
	adds r3, r4, #0
	bl j_TmCopyRect
	b _08036F8C
	.align 2, 0
_08036F64: .4byte 0x02003D2C
_08036F68: .4byte 0x02022CA8
_08036F6C: .4byte 0x0200422C
_08036F70: .4byte 0x020234A8
_08036F74:
	ldr r0, _08036F98 @ =0x02003D2C
	ldr r1, _08036F9C @ =0x02022CD0
	movs r2, #0xa
	adds r3, r4, #0
	bl j_TmCopyRect
	ldr r0, _08036FA0 @ =0x0200422C
	ldr r1, _08036FA4 @ =0x020234D0
	movs r2, #0xa
	adds r3, r4, #0
	bl j_TmCopyRect
_08036F8C:
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036F98: .4byte 0x02003D2C
_08036F9C: .4byte 0x02022CD0
_08036FA0: .4byte 0x0200422C
_08036FA4: .4byte 0x020234D0

