	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8063998, "ax", %progbits
@ sub_8063998 @ JP 0x08063998 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063998
	.thumb_func
sub_8063998:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080639DC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080639E0 @ =0x08600EC0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _080639E4 @ =0x086B8EC0
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldr r0, _080639E8 @ =0x086B3D44
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _080639EC @ =0x086B3B5C
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080639DC: .4byte 0x0201774C
_080639E0: .4byte 0x08600EC0
_080639E4: .4byte 0x086B8EC0
_080639E8: .4byte 0x086B3D44
_080639EC: .4byte 0x086B3B5C

