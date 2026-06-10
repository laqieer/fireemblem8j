	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8019450, 0x08019450 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set sub_801DA28, 0x0801DA28 + 1
	.section .text.sub_801F4E4, "ax", %progbits
@ sub_801F4E4 @ JP 0x0801F4E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F4E4
	.thumb_func
sub_801F4E4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8019994
	bl sub_8019450
	bl sub_8019914
	movs r0, #0
	bl sub_801DA28
	ldr r0, [r4, #0x30]
	movs r2, #0xbd
	cmp r0, #0
	beq _0801F504
	movs r2, #0xbe
_0801F504:
	ldr r0, _0801F51C @ =0x0202BCAC
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	ldr r1, [r4, #0x34]
	subs r1, r1, r0
	adds r0, r2, #0
	bl sub_8014B50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801F51C: .4byte 0x0202BCAC

