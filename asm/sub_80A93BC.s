	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80A93BC, "ax", %progbits
@ sub_80A93BC @ JP 0x080A93BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A93BC
	.thumb_func
sub_80A93BC:
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _080A93E4 @ =0x0203E890
	movs r4, #0x45
_080A93C4:
	ldr r0, [r5, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
	movs r1, #0x64
	bl __divsi3
	adds r6, r6, r0
	adds r5, #0x10
	subs r4, #1
	cmp r4, #0
	bge _080A93C4
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A93E4: .4byte 0x0203E890

