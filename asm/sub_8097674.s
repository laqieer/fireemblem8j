	.syntax unified
	.set GetGMapBaseMenuPid, 0x080C8E40 + 1
	.section .text.sub_8097674, "ax", %progbits
@ sub_8097674 @ JP 0x08097674 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097674
	.thumb_func
sub_8097674:
	push {lr}
	ldr r0, _08097688 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809768C
	bl GetGMapBaseMenuPid
	b _08097696
	.align 2, 0
_08097688: .4byte 0x03005270
_0809768C:
	ldr r0, _0809769C @ =0x020121CC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
_08097696:
	pop {r1}
	bx r1
	.align 2, 0
_0809769C: .4byte 0x020121CC

