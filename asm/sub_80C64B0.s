	.syntax unified
	.set NextRN_100, 0x08000C3C + 1
	.section .text.sub_80C64B0, "ax", %progbits
@ sub_80C64B0 @ JP 0x080C64B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C64B0
	.thumb_func
sub_80C64B0:
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _080C64DC @ =0x081F6620
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r2
	movs r5, #2
_080C64C0:
	bl NextRN_100
	ldr r1, [r4]
	cmp r0, r1
	bge _080C64CC
	adds r6, #1
_080C64CC:
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _080C64C0
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080C64DC: .4byte 0x081F6620

