	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_804EEBC, "ax", %progbits
@ sub_804EEBC @ JP 0x0804EEBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804EEBC
	.thumb_func
sub_804EEBC:
	push {lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0804EEC6
	movs r3, #6
_0804EEC6:
	ldr r2, _0804EEE4 @ =0x085E0660
	ldr r0, _0804EEE8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r1, [r0]
	movs r0, #0xc
	ands r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r3, #5
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0804EEE4: .4byte 0x085E0660
_0804EEE8: .4byte 0x0202BCEC

