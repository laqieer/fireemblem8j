	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_801E6AC, 0x0801E6AC + 1
	.set sub_8035848, 0x08035848 + 1
	.section .text.sub_801DC38, "ax", %progbits
@ sub_801DC38 @ JP 0x0801DC38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DC38
	.thumb_func
sub_801DC38:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8035848
	bl sub_801E6AC
	ldr r0, _0801DC50 @ =0x0202BCAC
	ldrh r0, [r0, #0x2e]
	cmp r0, #0
	beq _0801DC54
	movs r0, #0
	b _0801DC5E
	.align 2, 0
_0801DC50: .4byte 0x0202BCAC
_0801DC54:
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
	movs r0, #1
_0801DC5E:
	pop {r4}
	pop {r1}
	bx r1

