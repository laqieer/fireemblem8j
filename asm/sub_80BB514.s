	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8010F98, 0x08010F98 + 1
	.set sub_80BB350, 0x080BB350 + 1
	.set sub_80BBF08, 0x080BBF08 + 1
	.section .text.sub_80BB514, "ax", %progbits
@ sub_80BB514 @ JP 0x080BB514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB514
	.thumb_func
sub_80BB514:
	push {lr}
	ldr r0, _080BB544 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BB548 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080BB54C @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	bl sub_8010F98
	bl sub_80BBF08
	bl sub_80BB350
	movs r0, #7
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080BB544: .4byte 0x02022CA8
_080BB548: .4byte 0x020234A8
_080BB54C: .4byte 0x02023CA8

