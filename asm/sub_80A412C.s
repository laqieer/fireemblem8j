	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80A412C, "ax", %progbits
@ sub_80A412C @ JP 0x080A412C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A412C
	.thumb_func
sub_80A412C:
	push {r4, lr}
	ldr r4, _080A4144 @ =0x08A95650
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	adds r0, r0, r4
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A4144: .4byte 0x08A95650

