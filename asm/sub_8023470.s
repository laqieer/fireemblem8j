	.syntax unified
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.section .text.sub_8023470, "ax", %progbits
@ sub_8023470 @ JP 0x08023470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023470
	.thumb_func
sub_8023470:
	push {lr}
	ldr r0, _0802349C @ =0x02002774
	ldr r1, _080234A0 @ =0x06004000
	movs r2, #0x80
	lsls r2, r2, #2
	movs r3, #0
	bl sub_8003BE8
	ldr r0, _080234A4 @ =0x02022CFE
	ldr r1, _080234A8 @ =0x02003D2C
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	ldr r0, _080234AC @ =0x020234FE
	ldr r1, _080234B0 @ =0x0200422C
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	pop {r0}
	bx r0
	.align 2, 0
_0802349C: .4byte 0x02002774
_080234A0: .4byte 0x06004000
_080234A4: .4byte 0x02022CFE
_080234A8: .4byte 0x02003D2C
_080234AC: .4byte 0x020234FE
_080234B0: .4byte 0x0200422C

