	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_803A714, "ax", %progbits
@ sub_803A714 @ JP 0x0803A714 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A714
	.thumb_func
sub_803A714:
	push {lr}
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0803A722
	movs r0, #0
	b _0803A73A
_0803A722:
	ldr r0, _0803A740 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _0803A744 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #1
_0803A73A:
	pop {r1}
	bx r1
	.align 2, 0
_0803A740: .4byte 0x02022CA8
_0803A744: .4byte 0x020234A8

