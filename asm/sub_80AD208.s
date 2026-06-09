	.syntax unified
	.set DrawMinimapInternal, 0x080AC674 + 1
	.set InitMapForMinimap, 0x08019294 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80ACDE8, 0x080ACDE8 + 1
	.section .text.sub_80AD208, "ax", %progbits
@ sub_80AD208 @ JP 0x080AD208 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD208
	.thumb_func
sub_80AD208:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	ldr r0, _080AD23C @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080AD240 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	adds r0, r5, #0
	bl InitMapForMinimap
	adds r0, r4, #0
	bl sub_80ACDE8
	adds r0, r6, #0
	adds r1, r4, #0
	bl DrawMinimapInternal
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AD23C: .4byte 0x02022CA8
_080AD240: .4byte 0x020234A8

