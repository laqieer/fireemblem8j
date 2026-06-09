	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_809F560, "ax", %progbits
@ sub_809F560 @ JP 0x0809F560 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809F560
	.thumb_func
sub_809F560:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809F58C @ =0x08A96C4C
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0809F590 @ =0x08A968F4
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, _0809F594 @ =0x08A96A8C
	ldr r1, _0809F598 @ =0x06000200
	adds r4, r4, r1
	adds r1, r4, #0
	bl sub_8013008
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809F58C: .4byte 0x08A96C4C
_0809F590: .4byte 0x08A968F4
_0809F594: .4byte 0x08A96A8C
_0809F598: .4byte 0x06000200

